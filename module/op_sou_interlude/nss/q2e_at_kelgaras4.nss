/*Give PC the dagger,
bring Ali into the temple
restore oasis
*/


void Teleport()
{
    ClearAllActions();
    SetCommandable(FALSE, OBJECT_SELF);
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
}

void main()
{

    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(104));
    // Give the speaker the items
    CreateItemOnObject("q3_sac_blade", GetPCSpeaker(), 1);
    object oRod = GetObjectByTag("q2_rod_blight");
    if(oRod != OBJECT_INVALID)
        DestroyObject(oRod);
    object oContainerItem; // a probably item inside a bag
    object oItem;
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        oItem = GetFirstItemInInventory(oPC);
        while(oItem != OBJECT_INVALID)
        {
            if(GetTag(oItem) == "q2_rod_blight")
                DestroyObject(oItem);
            else
            {
                oContainerItem = GetFirstItemInInventory(oItem);
                while(oContainerItem != OBJECT_INVALID)
                {
                    if(GetTag(oContainerItem) == "q2_rod_blight")
                        DestroyObject(oContainerItem);
                    oContainerItem = GetNextItemInInventory(oItem);
                }
            }
            oItem = GetNextItemInInventory();
        }

        oPC = GetNextPC();
    }

    DelayCommand(2.0, Teleport());
    DelayCommand(2.5, DestroyObject(OBJECT_SELF));

}
