//::///////////////////////////////////////////////
//:: Name cutscene112
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This cutscene fires when the Seer is killed
    during the Siege.
    //if the PC is on the side of the rebels and the seer dies - the PC is a loser
    Turn everyone in the area neutral.
    Any remaining non-Maeviir's run away screaming
    House maeviir's celebrate good times.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 19/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"
#include "x0_i0_henchman"

void StartCutscene(object oPC);

void MakeAreaNeutral(object oPC);
void JumpPCToMatron();
int PickVictoryAnimation();
float RandomDelay();

int nCutsceneNumber = 112;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    object oBattleMaster = GetObjectByTag("q2abattle2master");
    object oPC = OBJECT_SELF;//GetLocalObject(oBattleMaster, "oPCForCut101");
    //Remove immobalize effect from PC (from end of battle conversation)
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }

    object oJumpTo = GetObjectByTag("wp_bat2seerdeath_pc");
    //Since this is the middle of a battle - lets make sure that the PC stays alive
    //(and his henchmen)
    SetImmortal(oPC, TRUE);
    int i = 1;
    effect eVis;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        SetImmortal(oHench, TRUE);
        i++;
        oHench = GetHenchman(oPC, i);
    }

    object oArea = GetArea(oPC);

    //Set Cutscene 112 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);

    //All PCs in the area will Fade to Black
    //Set Cutscene mode on each player in the area and do the fade
    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
       AssignCommand(oPlayer, ClearAllActions(TRUE));
       //Fade PCs to black
       BlackScreen(oPlayer);


       AssignCommand(oPlayer, JumpToObject(oJumpTo));
       if(oPlayer == oPC)
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);

       }
       else
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
       }

       CutSetCutsceneMode(0.5, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc vis - keep associates

       CutFadeFromBlack(1.5, oPlayer, FADE_SPEED_FASTEST, FALSE);

       oPlayer = GetNextPC();
    }
    MakeAreaNeutral(oPC);

    DelayCommand(1.5, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{

    // Cutscene actors and objects.
    object oSeer = GetObjectByTag("wp_bat2_seer");
    object oTarget = GetWaypointByTag("wp_q2abattle2_lossstart");
    object oWizard = GetObjectByTag("cut112endwiz");
    object oCopy = GetObjectByTag("Cut112Copy");

    CutSetActiveCutsceneForObject(oWizard, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oSeer, nCutsceneNumber);


    //locations
    object oNearSeer = GetWaypointByTag("wp_bat2_pcseertalk");

    //effects

    effect eKnockDown = EffectKnockdown();

    // Change the music
    object oArea = GetArea(OBJECT_SELF);
    DelayCommand(1.0, MusicBattlePlay(oArea));

    // Cutscene waypoint locations


    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("wp_cut112_pcstart"));
    object oCamera1 = GetWaypointByTag("wp_cut112_pcstart");
    location lCamera2 = GetLocation(GetWaypointByTag("cut112wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut112wp_camera3"));

    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    //CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 10.0, 75.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(5.5, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 15.0, 70.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutActionMoveToObject(5.5, oPC, oSeer, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //PC staggers over to Seer's body

    DelayCommand(1.5,AssignCommand(oCopy, ActionMoveToObject(oSeer, TRUE, 3.0)));
    //PC goes down to his knees
    CutApplyEffectToObject2(5.0, DURATION_TYPE_TEMPORARY, EffectKnockdown(), oCopy, 15.0, FALSE);
    //Evil Wizard appears and walks over
    CutApplyEffectAtLocation(2.5, oWizard, DURATION_TYPE_INSTANT, VFX_IMP_AC_BONUS, GetLocation(oTarget));
    CutJumpToObject(3.0, oWizard, oTarget, FALSE);
    CutPlayVoiceChat(5.0, oWizard, VOICE_CHAT_LAUGH, FALSE);
    //Evil Wizard casts on the PC
    CutSpeakStringByStrRef(6.0, oWizard, 85744, FALSE); //"Thus all enemies of the Valsharess shall end."

    CutActionCastFakeSpellAtObject(9.0, SPELL_WEIRD, oWizard, oCopy);

    CutApplyEffectToObject(13.0, DURATION_TYPE_PERMANENT, VFX_DUR_GLOBE_INVULNERABILITY, oCopy);

    CutSpeakStringByStrRef(15.0, oWizard, 85745);//"And now enough of you and your meddling."

    //Fade to Black - Hellball the PC.
    CutActionCastFakeSpellAtObject(15.5, SPELL_FIREBALL, oWizard, oCopy);//(464 - hellbell, 487 ruin)
    CutApplyEffectAtLocation(17.0, oWizard, DURATION_TYPE_INSTANT, 464, GetLocation(oSeer));
    CutDeath(20.0, oCopy, TRUE, FALSE);

    // End Cutscene

    CutFadeOutAndIn(20.5, oPC);

    //Clean up actors...

    CutDisableCutscene(nCutsceneNumber, 24.5, 24.5, RESTORE_TYPE_NONE);


    DelayCommand(22.0, JumpPCToMatron());
}

//Change all creatures in the Area to Neutral
//Good Creatures will run for the hills
//Evil Creatures will cheer
void MakeAreaNeutral(object oPC)
{
    //Make a copy of the PC to move about

    location lStart = GetLocation(oPC);
    object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut112Copy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);

    object oArea = GetArea(oPC);
    //object oPlayer = GetFirstPC();



    location lSpawn = GetLocation(GetWaypointByTag("cut112wp_factionstart"));
    object oFactionBoy = CreateObject(OBJECT_TYPE_CREATURE, "x2_factionboy", lSpawn);
    DestroyObject(oFactionBoy, 10.0);

    //cutscene wizard

    object oWizard = CreateObject(OBJECT_TYPE_CREATURE, "cut101_drowwiz", lSpawn, FALSE, "cut112endwiz");

    string szTag;
    string szReb= "q2abat2reb";
    string szReb1= "q2arebimloth";

    int nAnimation;
    object oScatter;

    object oCreature = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        //Make sure its a creature
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            //But not the PC or a henchman
            if (GetIsPC(oCreature) == FALSE && GetAssociateType(oCreature) != ASSOCIATE_TYPE_HENCHMAN)
            {
                ChangeFaction(oCreature, oFactionBoy);
                SetIsTemporaryFriend(oPC, oCreature);
                SetIsTemporaryFriend(oCopy, oCreature);

                AssignCommand(oCreature, ClearAllActions(TRUE));
                szTag = GetTag(oCreature);
                //Evil Creatures cheer (except the Seer and Tebomir)

                if (GetStringLeft(szTag, 10) == szReb || szTag == szReb1)
                {
                    oScatter = GetNearestObjectByTag("wp_q2_bat2_rebelscatter", oCreature);
                    DelayCommand(1.0, AssignCommand(oCreature, ClearAllActions(TRUE)));
                    DelayCommand(2.0, AssignCommand(oCreature, ActionMoveToObject(oScatter, TRUE)));
                    DestroyObject(oCreature, 5.0);

                }
                //else for the henchmen
                else if(szTag == "x2_hen_valen" || szTag == "x2_hen_nathyra" || szTag == "x2_hen_deekin")
                {
                    oScatter = GetNearestObjectByTag("wp_q2_bat2_rebelscatter", oCreature);
                    DelayCommand(1.0, AssignCommand(oCreature, ClearAllActions(TRUE)));
                    DelayCommand(2.0, AssignCommand(oCreature, ActionMoveToObject(oScatter, TRUE)));
                    DestroyObject(oCreature, 5.0);
                }
                else if (GetIsObjectValid(GetMaster(oCreature)) == FALSE && GetTag(oCreature) != "Cut112Copy")
                {
                    nAnimation = PickVictoryAnimation();
                    AssignCommand(oCreature, ActionPlayAnimation(nAnimation));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(3.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(8.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));

                }
            }

        }

        oCreature = GetNextObjectInArea(oArea);
    }
}
//PC no longer jumps to Matron
//Death of the Seer is End of Game for the PC
void JumpPCToMatron()
{
    object oMessage = GetFirstPC();
    effect eDeath = EffectDeath();

    object oHench;
    int i = 1;
    object oPC = GetFirstPC();

    while (GetIsObjectValid(oPC) == TRUE)
    {

        SetPlotFlag(oPC, FALSE);

        SetImmortal(oPC, FALSE);
        i = 1;
        oHench = GetHenchman(oPC, i);
        while(oHench != OBJECT_INVALID)
        {
            SetImmortal(oHench, FALSE);
            i++;
            oHench = GetHenchman(oPC, i);
        }

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oPC);

        oPC = GetNextPC();
    }


}
int PickVictoryAnimation()
{
    int nRandom = Random(3) + 1;
    int nAnimation;
    switch (nRandom)
    {
        case 1:    nAnimation = ANIMATION_FIREFORGET_VICTORY1;
                    break;
        case 2:    nAnimation = ANIMATION_FIREFORGET_VICTORY2;
                    break;
        case 3:    nAnimation = ANIMATION_FIREFORGET_VICTORY3;
                    break;
    }
    return nAnimation;
}
//Return a random delay up to 2.0 seconds
float RandomDelay()
{
    float fRandom = IntToFloat(Random(20)) / 10.0;
    return fRandom;

}
