package models;

public abstract class Entity {
  private final long id;

  protected Entity(long id) {
    this.id = id;
  }

  public long getId() {
    return id;
  }
}