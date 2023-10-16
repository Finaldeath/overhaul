// disable slave follow

void main()
{
    ClearAllActions();
    SetLocalObject(OBJECT_SELF, "Q3_FOLLOW", OBJECT_INVALID);
}
