void main()
{
    object oDoor = GetObjectByTag("M2Q1GB_M2Q1GA");

    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    DelayCommand(2.0,ActionMoveToObject(oDoor,TRUE));
    DelayCommand(10.0,DestroyObject(OBJECT_SELF));
}
