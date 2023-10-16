//::///////////////////////////////////////////////
//:: bk_invis_user
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    user defined event for invisible bridge
    - turns itself on/off
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: September 2003
//:://////////////////////////////////////////////

void RevealBridge()
{    // * invisible blocker. Destroy but leave a waypoint to remember where I was
    if (GetTag(OBJECT_SELF) == "bk_invis_blck")
    {
        CreateObject(OBJECT_TYPE_WAYPOINT, "NW_WAYPOINT001", GetLocation(OBJECT_SELF), FALSE, "makeblocker");
        DestroyObject(OBJECT_SELF, 0.3);
        return;
    }
    else
    {
        effect eHide = GetFirstEffect(OBJECT_SELF);
        if (GetEffectCreator(eHide) == OBJECT_SELF)
        {
            RemoveEffect(OBJECT_SELF, eHide);
        }
    }

}
void HideBridge()
{
    // * invisible blocker. Apply cutscene invis to me
    if (GetTag(OBJECT_SELF) == "bk_invis_blck")
    {
        effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvis, OBJECT_SELF);
        return;
    }
    else
    {
        effect eHide = EffectVisualEffect(VFX_DUR_DARKNESS);
        eHide = SupernaturalEffect(eHide);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHide, OBJECT_SELF);
        }


}

void main()
{
    int nEvent =GetUserDefinedEventNumber();
    switch (nEvent)
    {
        // * reveal
        case 11002: RevealBridge(); break;

        // * hide
        case 11003: HideBridge(); break;
    }
}
