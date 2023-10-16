// Initialize rest system of the area AND enable map pin for the drow camp

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    object oPin = GetObjectByTag("q6_map_note1");
    SetMapPinEnabled(oPin, 1);

    if(GetLocalInt(OBJECT_SELF, "REST_INIT") == 0)
    {
        SetLocalString(GetArea(OBJECT_SELF), "X2_WM_ENCOUNTERTABLE", GetTag(GetArea(OBJECT_SELF)));
        SetLocalInt(GetArea(OBJECT_SELF), "X2_L_WM_USE_APPEAR_ANIMATIONS", 1);
        SetLocalInt(OBJECT_SELF, "REST_INIT", 1);
    }

}
