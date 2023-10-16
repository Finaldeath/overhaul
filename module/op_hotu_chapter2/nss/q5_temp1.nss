void main()
{
    object oPC = GetFirstPC();
    object oNathyra = CreateObject(OBJECT_TYPE_CREATURE, "x2_nath", GetLocation(oPC));
    object oValen = CreateObject(OBJECT_TYPE_CREATURE, "x2_hen_valen", GetLocation(oPC));
    AddHenchman(oPC, oNathyra);
    AddHenchman(oPC, oValen);
}
