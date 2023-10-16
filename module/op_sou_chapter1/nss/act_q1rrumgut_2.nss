//Rumgut has been convinced to give the PC the cage key
void main()
{
    object oPC = GetPCSpeaker();
    CreateItemOnObject("q1rumgutkey", oPC);
    SetLocalInt(OBJECT_SELF, "nRumgutGiveUp", 1);
}
