
// make the guard init once the door to the treasury has been tampered with.

void  InitConv(object oPC)
{
    object oGuard = GetNearestObjectByTag("CT_COMM_SH_GHGD", oPC);

    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oGuard, ActionStartConversation(oPC));
}

void main()
{
    object oKiller = GetLastKiller();
    object oDamager = GetLastDamager();
    object oAttacker = GetLastAttacker();
    object oCaster= GetLastSpellCaster();
    object oDisturber = GetLastDisturbed();
    object oOpener = GetLastOpenedBy();

    if (oKiller != OBJECT_INVALID)
        InitConv(oKiller);
    else if (oDamager != OBJECT_INVALID)
        InitConv(oDamager);
    else if (oAttacker != OBJECT_INVALID)
        InitConv(oAttacker);
    else if (oCaster != OBJECT_INVALID)
        InitConv(oCaster);
    else if (oDisturber != OBJECT_INVALID)
        InitConv(oDisturber);
    else if (oOpener != OBJECT_INVALID)
        InitConv(oOpener);
}
