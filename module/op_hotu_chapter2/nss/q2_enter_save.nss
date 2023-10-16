//q2_enter_save
//Do autosave - first time into this area
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nAutoSave") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nAutoSave", 1);
    DoSinglePlayerAutoSave();
}
