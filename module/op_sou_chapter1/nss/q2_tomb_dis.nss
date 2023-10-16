void main()
{
    object oPC = GetLastDisturbed();
    if(GetInventoryDisturbType() != INVENTORY_DISTURB_TYPE_REMOVED)
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_DIS_ONCE");
    if(nDoOnce == 1)
      return;
    SetLocalInt(OBJECT_SELF, "DO_DIS_ONCE", 1);
    object oNilmaldor = GetNearestObjectByTag("Q2_NILMALDOR");
    AdjustReputation(oPC, oNilmaldor, -100);
    AdjustReputation(oNilmaldor, oPC, -100);
    AssignCommand(oNilmaldor, ActionAttack(oPC));
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 2);

}
