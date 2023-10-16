void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        SetLocalInt(GetNearestObjectByTag("M1Q5GDoor1"),"NW_L_PCCanOpen",TRUE);
        DestroyObject(OBJECT_SELF);
    }
}
