//::///////////////////////////////////////////////
//:: Name act_q2d4brain_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has decided to bash some brain!

    Overmind Variables

    X2_Q2DOvermind - 0  : Not dealt with
    X2_Q2DOvermind - 1  : Killed
    X2_Q2DOvermind - 2  : Negotiated agreement
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////
//UPDATE - The first time this is called - we'll jump the PC to the
//dream/illusion area - second time - go ahead and bash the brain
#include "nw_i0_generic"
#include "x2_inc_globals"
#include "nw_i0_plot"
#include "x0_i0_henchman"
void CreateDeadBrain();
void SpawnInDefenders(object oPC);
void CreateDefender(string szResRef, location lSpawn, object oPC);
void EnterOvermindIllusion(object oPC);
void DispelAssociate(object oAssociate);

void main()
{
    //Add check because of possibility of multiple attacks
    if (GetLocalInt(GetModule(), "X2_nQ2DBrainBashOk") == 1)
        return;

    object oPC = GetPCSpeaker();

    SetLocalInt(OBJECT_SELF, "nBrainBashed", GetLocalInt(OBJECT_SELF, "nBrainBashed") + 1);

    if (GetLocalInt(OBJECT_SELF, "nBrainBashed") == 1)
    {
        SetLocalInt(GetModule(), "X2_nQ2DBrainBashOk", 1);
        EnterOvermindIllusion(oPC);
        return;
    }
    else if (GetLocalInt(OBJECT_SELF, "nBrainBashed") > 2)
        return;


    AddJournalQuestEntry("q2_zorvakmur",97,oPC);
    Reward_2daXP(oPC, 47);

    //floating text string
    FloatingTextStrRefOnCreature(86891, oPC);

    //Spawn in the defenders
    SpawnInDefenders(oPC);

    //Walls of swords
    ExecuteScript("q2d4_setupilsn", OBJECT_SELF);

    effect eBash = EffectVisualEffect(VFX_COM_CHUNK_GREEN_MEDIUM);
    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGSTINK);
    effect eAOE2 = EffectAreaOfEffect(43);

    object oBrain = OBJECT_SELF;
    object oSound1 = GetObjectByTag("snd_brainpool1");
    object oSound2 = GetObjectByTag("snd_brainpool2");
    location lVfx1 = GetLocation(GetObjectByTag("q2d4_vfx_deadbrain"));
    location lVfx2 = GetLocation(GetObjectByTag("q2d4_vfx_deadbrain1"));
    location lVfx3 = GetLocation(GetObjectByTag("q2d4_vfx_deadbrain2"));
    location lVfx4 = GetLocation(GetObjectByTag("q2d4_vfx_deadbrain3"));
    location lVfxNew = GetLocation(GetObjectByTag("q2d4_newaoevfx"));
    location lSelf = GetLocation(oBrain);

    //PC Bashes brain
    AssignCommand(oPC, ActionAttack(oBrain));
    //Apply Brain Bashing effects
    DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBash, lSelf));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBash, lSelf));
    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBash, lSelf));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAOE, lVfx1));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAOE, lVfx2));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAOE, lVfx3));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAOE, lVfx4));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eAOE2, lVfxNew));

    DestroyObject(oBrain, 15.0);
    DelayCommand(14.5, CreateDeadBrain());
    DelayCommand(14.5, SoundObjectStop(oSound1));
    DelayCommand(14.5, SoundObjectStop(oSound2));
    //Global Plot Int
    SetGlobalInt("X2_Q2DOvermind", 1);
    //Hall Transporter Int
    SetLocalInt(GetModule(), "X2_Q2DKilledOvermind", 1);

    //All mindflayers go hostile

    object oMF = GetFirstObjectInArea();
    string szTag = GetTag(oMF);
    while (GetIsObjectValid(oMF)  == TRUE)
    {
        if (GetObjectType(oMF) == OBJECT_TYPE_CREATURE)
        {
            if (szTag == "q2d_master" || GetStringLeft(szTag, 8) == "cut101_g" || GetStringLeft(szTag, 9) == "q2d_poolg"
                || GetStringLeft(szTag, 9) == "q2dthrall" || szTag == "q2d4baddog")
            {
                if (GetLocalInt(oMF, "nFreed") == 0)
                {
                    ChangeToStandardFaction(oMF, STANDARD_FACTION_HOSTILE);
                    SetIsTemporaryEnemy(oPC, oMF);
                }
            }
        }
        oMF = GetNextObjectInArea();
        szTag = GetTag(oMF);
    }
    SetLocalInt(GetModule(), "X2_Q2DIllithidHostile", 1);
    //Activate Wandering Monsters
    object oArea = GetArea(OBJECT_SELF);
    SetLocalString(oArea,"X2_WM_ENCOUNTERTABLE", "ZorvakMurHall");
    //Destroy any of the illusions that might exist in this area
}

void CreateDeadBrain()
{
    location lSpawn = GetLocation(GetWaypointByTag("wp_q2d_deadbrain"));
    CreateObject(OBJECT_TYPE_PLACEABLE, "q2d_overmind2", lSpawn);
}

//Set wave of defenders in motion
void SpawnInDefenders(object oPC)
{
    //open the door to the room
    object oDoor = GetObjectByTag("q2d4_overmind_door");
    if (GetIsObjectValid(oDoor) == TRUE)
    {
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
    }

    location lSpawn = GetLocation(GetWaypointByTag("wp_q2d4_brainattacked_spawn"));
    CreateDefender("cut101_guard", lSpawn, oPC);
    DelayCommand(2.0, CreateDefender("cut101_guard", lSpawn, oPC));
    DelayCommand(4.0, CreateDefender("cut101_guard", lSpawn, oPC));
    DelayCommand(6.0, CreateDefender("q2d_poolguard_", lSpawn, oPC));
    DelayCommand(8.0, CreateDefender("q2d_poolguard_", lSpawn, oPC));
    DelayCommand(10.0, CreateDefender("q2d_poolguard_", lSpawn, oPC));
    DelayCommand(12.0, CreateDefender("q2d_poolguard_", lSpawn, oPC));
    DelayCommand(14.0, CreateDefender("q2d_master", lSpawn, oPC));
}

//Create a creature and have it attack the PC
void CreateDefender(string szResRef, location lSpawn, object oPC)
{
    object oDefender = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn);
    ChangeToStandardFaction(oDefender, STANDARD_FACTION_HOSTILE);
    AssignCommand(oDefender, ActionAttack(oPC));

}

void EnterOvermindIllusion(object oPC)
{
        object oPool = OBJECT_SELF;
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
        object oMessage = GetFirstPC();
        object oPlayer = oMessage;

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
void DispelAssociate(object oAssociate)
{
    effect eDispel = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDispel, GetLocation(oAssociate));
    DestroyObject(oAssociate);
}

