enum Direction {
  UP, DOWN, IDLE
};

abstract class Request {
  protected int floor;
  protected long timeStamp;

  public Request(int floor) {
    this.floor = floor;
    this.timeStamp = System.currentTimeMillis();
  }

  public int getFloor() {
    return floor;
  }
  public long getTimeStamp() {
    return timeStamp;
  }
}

class InternalRequest extends Request {
  public InternalRequest(int floor) {
    super(floor);
  }
}

class ExternalRequest extends Request {
  public Direction direction;

  public ExternalRequest(int floor, Direction direction) {
    this.direction = direction;
    super(floor);
  }

  public Direction getDirection() {
    return direction;
  }
}

class Elevator {
  private final int id;
  private int currentFloor;
  private Direction currentDirection;
  private final int minFloor;
  private final int maxFloor;


}
