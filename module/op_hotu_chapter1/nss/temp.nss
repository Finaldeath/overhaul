void main()
{
    object oPC = GetFirstPC();
    object oTomi = CreateObject(OBJECT_TYPE_CREATURE, "x2_hen_tomi2", GetLocation(oPC));
    AddHenchman(oPC, oTomi);
}
