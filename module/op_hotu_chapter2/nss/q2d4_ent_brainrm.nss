//::///////////////////////////////////////////////
//:: Name q2d4_ent_brainrm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a player on the hostile track enters the brain
    pool room - Fire some effects and transfer the PC
    to the Illusionary Forest..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 5/03
//:://////////////////////////////////////////////

#include "x0_i0_henchman"
void DispelAssociate(object oAssociate);
void MakeAreaNeutral(object oPC);

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) == FALSE)
        return;

    //The Elder Brain
    object oPool = GetObjectByTag("q2d_overmind");
    //Variable so that the Brain will be bashed next time - not send the PC to illusionary forest
    SetLocalInt(oPool, "nBrainBashed", 1);

    //if this pc jumped directly into the mindflayer room and is now leaving the area..
    if (GetLocalInt(oPC, "X2_Q2D4Enterhall") == 0)
        return;

    //Subsequent times in - have the PC talk to the pool
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
    {

        if (GetIsObjectValid(oPool) == TRUE)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionMoveToObject(oPool, TRUE));
            DelayCommand(1.0, AssignCommand(oPool, ActionStartConversation(oPC)));
        }
        return;
    }



    //if the Illithid are hostile and the PC hasn't 'negotiated' already with the Overmind.
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0 && GetLocalInt(GetModule(), "X2_TalkedToOvermind") == 0)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        object oVfx1 = GetObjectByTag("vfx_q2d4_row1");
        object oVfx2 = GetObjectByTag("vfx_q2d4_row2");
        object oVfx3 = GetObjectByTag("vfx_q2d4_row3");
        object oVfx4 = GetObjectByTag("vfx_q2d4_row4");
        object oVfx5 = GetObjectByTag("vfx_q2d4_row5");

       /* effects  -  dur_mindaffectingneg/and positive and premonition for the PC
                     - then dispel disjunction at the end and restoration imp
            area effects - blind deaf or IMP_dispel, imp_magic protection
                            pw stun
                            death on all placeables..holy aid, imp_magblue

        */
        effect eVfx1 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
        effect eVfx2 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
        effect eVfx3 = EffectVisualEffect(VFX_DUR_PROT_PREMONITION);
        effect eVfx4 = EffectVisualEffect(VFX_IMP_DISPEL_DISJUNCTION);
        effect eVfx5 = EffectVisualEffect(VFX_IMP_RESTORATION);
        effect eVfx6 = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
        effect eVfx7 = EffectVisualEffect(VFX_IMP_DISPEL);
        effect eVfx8 = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
        effect eVfx9 = EffectVisualEffect(VFX_FNF_PWSTUN);
        effect eVfx10 = EffectVisualEffect(VFX_IMP_DEATH);
        effect eVfx11 = EffectVisualEffect(VFX_IMP_HOLY_AID);
        effect eVfx12 = EffectVisualEffect(VFX_IMP_MAGBLUE);

        effect eLink1 = EffectLinkEffects(eVfx1, eVfx2);
        //Freeze and jump All PCs in the area.
        object oTarget = GetWaypointByTag("wp_q2d_illforest_pcstart");

        object oArea = GetArea(OBJECT_SELF);
        string szArea = GetTag(oArea);

        //Everything goes neutral until the PC returns
        MakeAreaNeutral(oPC);

        object oPlayer = GetFirstPC();

        int nCount;
        object oHenchman;
        object oAssociate;

        while (oPlayer != OBJECT_INVALID)
        {
            //If they are in the same area - freeze and teleport them
            if (GetTag(GetArea(oPlayer)) == szArea)
            {
                AssignCommand(oPlayer, ClearAllActions(TRUE));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPlayer, 8.0);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oPlayer);
                DelayCommand(2.0, AssignCommand(oPool, ActionCastFakeSpellAtObject(693, oPC)));
                DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVfx3, oPlayer));
                DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVfx4, oPlayer));
                DelayCommand(8.2, AssignCommand(oPlayer, JumpToObject(oTarget)));

                //if the PC has a henchman - remove them until he returns to the area.
                //ok - lets try making the henchmen invis and immobile during the dream

                //Fire the henchmen - dispell all other associates - rehire afterwards
                //nCount = 1;
                oHenchman = GetHenchman(oPlayer);
                while (GetIsObjectValid(oHenchman) != FALSE)
                {
                    FireHenchman(oPlayer, oHenchman);
                    AssignCommand(oHenchman, ClearAllActions(TRUE));
                    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oHenchman);
                    //DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oHenchman));
                    //nCount++;
                    //don't use ncount here because when you fire the first henchmen - henchmen#2 drops down a slot
                    oHenchman = GetHenchman(oPlayer);
                }
                oAssociate = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION);
                if (GetIsObjectValid(oAssociate) == TRUE)
                {
                    DispelAssociate(oAssociate);
                }
                oAssociate = GetAssociate(ASSOCIATE_TYPE_DOMINATED);
                if (GetIsObjectValid(oAssociate) == TRUE)
                {
                    DispelAssociate(oAssociate);
                }
                oAssociate = GetAssociate(ASSOCIATE_TYPE_FAMILIAR);
                if (GetIsObjectValid(oAssociate) == TRUE)
                {
                    DispelAssociate(oAssociate);
                }
                oAssociate = GetAssociate(ASSOCIATE_TYPE_SUMMONED);
                if (GetIsObjectValid(oAssociate) == TRUE)
                {
                    DispelAssociate(oAssociate);
                }
            }
            oPlayer = GetNextPC();
        }


   }
}

void DispelAssociate(object oAssociate)
{
    effect eDispel = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDispel, GetLocation(oAssociate));
    DestroyObject(oAssociate);
}

void MakeAreaNeutral(object oPC)
{
    object oArea = OBJECT_SELF;
    object oCreature = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            if (GetReputation(oCreature, oPC) < 11)
            {
                AssignCommand(oCreature, ClearAllActions(TRUE));
                SetIsTemporaryFriend(oPC, oCreature);
            }
        }
        oCreature = GetNextObjectInArea(oArea);
    }
}

