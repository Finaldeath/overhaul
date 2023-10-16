// take relic from player

void main()
{
    object oPC = GetPCSpeaker();
    object oRelic = GetItemPossessedBy(oPC, "x2_p_reaper");
    SetPlotFlag(oRelic, FALSE);
    SetItemCursedFlag(oRelic, FALSE);
    DestroyObject(oRelic);
}
