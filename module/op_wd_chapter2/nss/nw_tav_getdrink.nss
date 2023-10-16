void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_HaveDrink") == 10)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_HaveDrink",0);
    }
    SetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT",0);
}
