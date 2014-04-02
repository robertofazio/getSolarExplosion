class PixelPusherObserver implements Observer 
{
  public boolean started      = false;
  
  public void update(Observable registry, Object updatedDevice) 
  {
    if (updatedDevice != null) 
    {
      //println("Device change: " + updatedDevice);
      this.started   = true;
    }    
  }
}
