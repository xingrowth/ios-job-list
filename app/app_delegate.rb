class AppDelegate < PM::Delegate
  include CDQ # Remove this if you aren't using CDQ

  status_bar true, animation: :fade

  # Without this, settings in StandardAppearance will not be correctly applied
  # Remove this if you aren't using StandardAppearance
  ApplicationStylesheet.new(nil).application_setup

  def on_load(_app, _options)
    cdq.setup # Remove this if you aren't using CDQ
    open_authenticated_root
  end

  def show_menu
    @menu.show :left
  end

  # Remove this if you are only supporting portrait
  def application(_application, willChangeStatusBarOrientation: new_orientation, duration: duration)
    # Manually set RMQ's orientation before the device is actually oriented
    # So that we can do stuff like style views before the rotation begins
    device.orientation = new_orientation
  end

  def open_authenticated_root
    open_tab_bar HomeScreen.new(nav_bar: true)
    @menu = open MenuDrawer
  end
end
