// Part of the portcullis trap:
// marks any kobold entering this trigger as belonging to it. Later, the trigger would know whose kobolds
// belong to it.

void main()
{
    SetLocalObject(GetEnteringObject(), "Q5_BELONG_TO_TRIGGER", OBJECT_SELF);
}
