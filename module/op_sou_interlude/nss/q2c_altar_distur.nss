// replace rod and destroy undead

#include "x1_inc_plot"

int InsidePool(vector vPos)
{
    return (vPos.x >= 22.0 && vPos.x <=46.0 && vPos.y >= 42.0 && vPos.y <=65.0);
}

void SwitchOasisArea()
{
    float fFace;
    vector vPos;
    location lLoc;
    object oShore;
    object oNewArea = GetObjectByTag("q1_OasisoftheGreenPalm2");
    object oOldArea = GetObjectByTag("q1_OasisoftheGreenPalm");
    object oObject = GetFirstObjectInArea(oOldArea);
    object oCopy;
    while(oObject != OBJECT_INVALID)
    {
        int nType = GetObjectType(oObject);
        if(nType == OBJECT_TYPE_ITEM || nType == OBJECT_TYPE_CREATURE)
        {
            fFace = GetFacing(oObject);
            vPos = GetPosition(oObject);
            lLoc = Location(oNewArea, vPos, fFace);
            if(nType == OBJECT_TYPE_ITEM)
                oCopy = CopyObject(oObject, lLoc);
            else // a creature
            {
                if(GetIsPC(oObject) || GetMaster(oObject) != OBJECT_INVALID
                    || GetTag(oObject) == "x0_hen_dee" || GetTag(oObject) == "x0_hen_dor"
                    || GetTag(oObject) == "x0_hen_xan")

                    AssignCommand(oObject, JumpToLocation(lLoc));

            }
            if(InsidePool(vPos))
            {
                oShore = GetNearestObjectByTag("Q2A2_WP_SAFE_SHORE", oCopy);
                vPos = GetPosition(oShore);
                lLoc = Location(oNewArea, vPos, fFace);
                CopyObject(oObject, lLoc);
                DestroyObject(oCopy);
            }
        }
        oObject = GetNextObjectInArea(oOldArea);
    }

}

void main()
{
    object oPC = GetLastDisturbed();

    object oItem = GetInventoryDisturbItem();
    if(GetInventoryDisturbType() != INVENTORY_DISTURB_TYPE_ADDED)
        return;
    if(GetTag(oItem) == "Q3_SAC_BLADE" && GetPlot("Q2_JOURNAL_ROD") == 30)
    {
         int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SWITCH_ITEM_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_SWITCH_ITEM_ONCE", 1);
        CreateItemOnObject("item002", oPC, 1);
        effect eVis = EffectVisualEffect(VFX_IMP_HARM);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
        // destroy the blade
        if(GetIsObjectValid(oItem) != 0)
            DestroyObject(oItem);
        SetPlot("Q2_JOURNAL_ROD", 80, oPC);
        SwitchOasisArea();
        object oLight = GetNearestObjectByTag("ShaftofLightYellow");
        SetPlotFlag(oLight, FALSE);
        object oNewLight = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_solred", GetLocation(oLight));
        SetPlotFlag(oNewLight, TRUE);
        DestroyObject(oLight, 0.5);
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(103));
        return;
    }
    if(GetTag(oItem) != "q2_rod_blight")
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SWITCH_ITEM_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SWITCH_ITEM_ONCE", 1);

    DelayCommand(0.5, DestroyObject(oItem));

    //SetLocalInt(GetModule(), "Q2_ROD_DESTROYED", 1);
    CreateItemOnObject("q2_rod_dawn", OBJECT_SELF, 1);
    DelayCommand(2.0, AssignCommand(oPC, ActionInteractObject(OBJECT_SELF)));
    SetPlot("Q2_JOURNAL_ROD", 100, oPC);
    // new start location is the restores oasis
    object oWP = GetWaypointByTag("Q2_START2");
    object oOldWP = GetWaypointByTag("Q2_START");
    SetLocalObject(GetModule(), "X1_CURRENT_START", oWP);
    CreateObject(OBJECT_TYPE_PLACEABLE, "jumpportal", GetLocation(oOldWP)); // for multiplayer
    SwitchOasisArea();

    effect eVis = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    // Remove items from the player's inventory
    object oKelGaras = GetNearestObjectByTag("Q2_KELGARAS");
    SetLocalInt(oKelGaras, "FINAL_DEATH", 1);
    SignalEvent(oKelGaras, EventUserDefined(101));
    int n = 1;
    object oUndead = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, n);
    effect eVis2 = EffectVisualEffect(VFX_IMP_DESTRUCTION);
    effect eDeath = EffectDeath();
    effect eLink = EffectLinkEffects(eVis2, eDeath);
    float fDelay = 0.0;
    while(oUndead != OBJECT_INVALID)
    {
        fDelay += 0.1;
        if(GetArea(oUndead) == GetArea(OBJECT_SELF))
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oUndead));

        n++;
        oUndead = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, n);
    }


}
