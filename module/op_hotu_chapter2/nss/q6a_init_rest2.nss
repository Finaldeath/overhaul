void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    if(GetLocalInt(OBJECT_SELF, "REST_INIT") == 1
        && GetLocalInt(GetModule(), "Q6_NO_DRIDER_WM") == 1)
    {
        SetLocalString(GetArea(OBJECT_SELF), "X2_WM_ENCOUNTERTABLE", GetTag(GetArea(OBJECT_SELF)) + "2");
        SetLocalInt(GetArea(OBJECT_SELF), "X2_L_WM_USE_APPEAR_ANIMATIONS", 1);
        SetLocalInt(OBJECT_SELF, "REST_INIT", 2);
    }

}
