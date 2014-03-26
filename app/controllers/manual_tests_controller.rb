class ManualTestsController < ApplicationController

  before_filter :only => [:new, :create] do
    @version = Version.find(params[:id])
    @project = @version.project
  end

  def new
    @manual_test = ManualTest.new
  end

  def create
    @manual_test = ManualTest.new(params[:manual_test])
    @manual_test.user_id = current_user.id
    @manual_test.test_status = ManualTest::New
    @manual_test.version_id = @version.id
    if @manual_test.save
      flash[:notice] = 'Test zostal utworzony pomyslnie'
      redirect_to version_path(@version)
    else
      flash[:alert] = 'Wystapil blad'
      render :new
    end
  end

  def show
    @manual_test = ManualTest.find(params[:id])
    @version = @manual_test.version
    @project = @version.project
  end

  def update
    @manual_test = ManualTest.find(params[:id])
    if @manual_test.test_status == ManualTest::New and @manual_test.update_attributes(params[:manual_test])
      flash[:notice] = 'Aktualizacja przebiegla pomyslnie'
      redirect_to action: 'show'
    else
      flash[:alert] = 'Aktualizacja przebiegla pomyslnie'
      render :show
    end
  end

  def submit
    @manual_test = ManualTest.find(params[:manual_test_id])
    if @manual_test.test_status == ManualTest::New
      @manual_test.test_status = ManualTest::UnderVerification
      @manual_test.save!
      flash[:notice] = 'Test zostal przeslany do weryfikacji'
    end
    redirect_to manual_test_path(@manual_test)
  end

  ##
  # Oznacz jako poprawny pod katem merytorycznym
  def verify
    @manual_test = ManualTest.find(params[:manual_test_id])
    if @manual_test.test_status == ManualTest::UnderVerification
      @manual_test.test_status = ManualTest::Verified
      @manual_test.save!
      flash[:notice] = 'Test zostal zaakceptowany pod katem merytorycznym'
    end
    redirect_to manual_test_path(@manual_test)
  end

  ##
  # Odrzuc ze wzgledu na brak poprawnosci merytorycznej
  def deny
    @manual_test = ManualTest.find(params[:manual_test_id])
    if @manual_test.test_status == ManualTest::UnderVerification
      @manual_test.test_status = ManualTest::New
      @manual_test.save!
      flash[:notice] = 'Test zostal odrzucony'
    end
    redirect_to manual_test_path(@manual_test)
  end

end