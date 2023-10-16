// * give player Stone of Recall, if they don't have one
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC)
        && GetIsObjectValid(GetItemPossessedBy(oPC,"NW_IT_RECALL")) == FALSE)
    {
        CreateItemOnObject("NW_IT_RECALL", oPC);
    }
/*    if(GetLocalInt(GetModule(),"NW_G_M3Q1A10_AUTOSAVE")==0
        && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M3Q1A10_AUTOSAVE",1);
    }*/
}
