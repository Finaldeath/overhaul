// take a random potion from pc

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetFirstItemInInventory(oPC);
    string sTag;
    while(oItem != OBJECT_INVALID)
    {
        sTag = GetTag(oItem);
        if(GetStringLeft(sTag, 13) == "NW_IT_MPOTION")
        {
            DestroyObject(oItem);
            effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
            object oWP = GetWaypointByTag("wp_q7jnah_secret_lairent");
            DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oWP)));

            return;
        }
        oItem = GetNextItemInInventory(oPC);

    }

}
