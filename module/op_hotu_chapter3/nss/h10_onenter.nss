//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the generic onenter script for "ring
     vision" areas.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
#include "x2_inc_toollib"
// Apply invis effect to prison blocks.
void PrisonInvis();

void SetupFight()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    // the number of devils from the cutscenes
    SetLocalInt(OBJECT_SELF, "YJ_DEVILS_COUNT", 12);
}

void main()
{
    object oPC = GetEnteringObject();
    // re-init the demons arrival if a savegame (the delay has been lost)
    if(GetLocalInt(OBJECT_SELF, "DELAY_STATRED") == 1 &&
        GetLocalInt(OBJECT_SELF, "YJ_FIGHT_STARTED") == 0)
        SetLocalInt(OBJECT_SELF, "YJ_FIGHT_STARTED", 1);
    SetupFight(); // setup army fight
    // * flood area with tiles
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        int nColumns = 16;
        int nRows = 16;

        TLChangeAreaGroundTiles(OBJECT_SELF, X2_TL_GROUNDTILE_LAVA, nColumns, nRows, -1.3);

        PrisonInvis();
    }
    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}

void PrisonInvis()
{
    int x = 0;
    object oInvis = GetObjectByTag("hx_prison_block", x);

    while(GetIsObjectValid(oInvis))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oInvis);
        x = x + 1;
        oInvis = GetObjectByTag("hx_prison_block", x);
    }
}
