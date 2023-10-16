void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        SetLocalInt(GetNearestObjectByTag("M1Q5GDoor2"),"NW_L_PCCanOpen",TRUE);
        DestroyObject(OBJECT_SELF);
    }
}
