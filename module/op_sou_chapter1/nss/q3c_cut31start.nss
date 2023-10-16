/* J'Nah's Cutscene:
 * 1. J'Nah plays casting animation.
 * 2. Visual effects appear at Q3C_WP_CENTER and the surrounding Q3C_WP_RUNE
 * 3. Hooded figure appears.
 * 4. Dialog between J'Nah and hooded figure.
 * 5. Quemozeng (J'Nah's familiar) tells J'Nah that someone is in the hall
 * 6. Hooded figure gives one last line and disappears
 * 7. J'Nah faces the player and asks him to talk to her.
 */

//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 4/3/2003
//:://////////////////////////////////////////////

int CUTSCENE_NUMBER = 31;
int SUMMON_SPELL = SPELL_GATE; // the effect for the fake spell J'Nah casts to communicate.
int SUMMON_EFFECT_BRING = VFX_FNF_DISPEL_DISJUNCTION; // the commune spell effect to bring the hooded figure
int SUMMON_EFFECT_RUNES = VFX_IMP_LIGHTNING_M; // Rune effects for the commune spell.
//int SUMMON_EFFECT_ON_FIGURE = VFX_DUR_ETHEREAL_VISAGE; // the effect on the hooden figure after she appears


float TIME_START = 0.0;
float TIME_AFTER_FADE = 3.0;
float TIME_MOVE1 = 5.0;
float TIME_RUNES = TIME_MOVE1 + 3.0;
float TIME_RUNE_INTERVAL = 0.7;
float TIME_RUNES_END = TIME_RUNES + TIME_RUNE_INTERVAL * 8;
float TIME_DIALOG = TIME_RUNES_END + 2.0;
float TIME_LINE_INTERVAL = 3.8;
float TIME_END = TIME_DIALOG + TIME_LINE_INTERVAL * 10 + 3.0;

#include "x1_inc_cutscene"

void StartCutscene(object oPC);
void RemoveCutInvis(object oCreature);
void ReturnPlayers();
object FreezeAssociate(object oPlayers);
void RemoveAssociateEffects(object oCreature);
void UnFreezeAssociate(object oPlayers);

void main()
{
    //Need to find out which PC triggered the cutscene

    object oPC;
    object oCharacter = GetFirstPC();
    while (oCharacter != OBJECT_INVALID && oPC == OBJECT_INVALID)
    {
        if (GetLocalInt(oCharacter, "nCUT31MAINPC") == 1)
            oPC = oCharacter;
        oCharacter = GetNextPC();

    }

    SetLocalInt(GetModule(), "X1_CUT31RUNNING", 1);

    //Jump MultiPlayerPCs to their station..


    object oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        //Dominated creatures need to be stored in case domination ends during cutscene
        object oDominated = FreezeAssociate(oPlayers);
        if (GetIsObjectValid(oDominated) == TRUE)
            SetLocalObject(oPlayers, "oDominated", oDominated);
        //if this isn't the PC who openned the door.
        if (GetName(oPlayers) != GetName(oPC))
        {
            //If they are in J'Nah's area
            if (GetTag(GetArea(oPlayers)) == "Q3C_AncientTemple")
            {
                SetLocalInt(oPlayers, "nCutsceneNumber", CUTSCENE_NUMBER);
                CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPlayers, TRUE, FALSE, TRUE);

                CutSetLocation(CUTSCENE_NUMBER, 0.0, oPlayers);
                CutFadeOutAndIn(CUTSCENE_NUMBER, 1.0, oPlayers);
                CutApplyEffectToObject(CUTSCENE_NUMBER, 3.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPlayers, 9999.0);
                CutJumpToObject(CUTSCENE_NUMBER, 3.75, oPlayers, GetObjectByTag("wp_q3cut31pcx"));
            }
        }
        oPlayers = GetNextPC();
    }
    StartCutscene(oPC);
}

void StartCutscene(object oPC)
{
    CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPC, TRUE, FALSE, TRUE);
    float fDelay = 1.0;
    object oFigure = GetObjectByTag("Q3_HOODED_FIGURE");

    SetLocalInt(oFigure, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oQuasit = GetObjectByTag("Q3_QUEMOZENG");
    object oJnah = GetObjectByTag("Q3_JNAH");
    object oArea = GetArea(oJnah);

    object oCameraInit = GetWaypointByTag("Q3C_WP_CAMERA_INIT");
    object oCamera1 = GetWaypointByTag("Q3C_WP_CAMERA1");
    object oCenter = GetWaypointByTag("Q3C_WP_CENTER");
    object oRune1 = GetNearestObjectByTag("Q3C_WP_RUNE1");
    object oRune2 = GetNearestObjectByTag("Q3C_WP_RUNE2");
    object oRune3 = GetNearestObjectByTag("Q3C_WP_RUNE3");
    object oRune4 = GetNearestObjectByTag("Q3C_WP_RUNE4");
    object oRune5 = GetNearestObjectByTag("Q3C_WP_RUNE5");
    object oRune6 = GetNearestObjectByTag("Q3C_WP_RUNE6");
    object oRune7 = GetNearestObjectByTag("Q3C_WP_RUNE7");
    object oRune8 = GetNearestObjectByTag("Q3C_WP_RUNE8");
    //object oFacing = GetWaypointByTag("Q3C_WP_FACING");

    //StartCutsceneMusic
    MusicBackgroundChangeDay(oArea, TRACK_TEMPLEEVIL);
    MusicBackgroundChangeNight(oArea, TRACK_TEMPLEEVIL);
    MusicBackgroundPlay(oArea);

    // create a copy of the player for the camera
    //CutRemoveEffects(CUTSCENE_NUMBER, 0.0, oPC);
    CutSetLocation(CUTSCENE_NUMBER, 3.0, oPC);
    CutFadeOutAndIn(CUTSCENE_NUMBER, 1.0, oPC);
    //object oNewPC = CopyObject(oPC, GetLocation(oPC));
    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_AFTER_FADE, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPC, 9999.0);
    CutJumpToLocation(CUTSCENE_NUMBER, TIME_AFTER_FADE, oPC, GetLocation(oCameraInit));
    CutSetCamera(CUTSCENE_NUMBER, TIME_AFTER_FADE + 1.0, oPC, CAMERA_MODE_TOP_DOWN, 170.0, 30.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1, oPC, GetLocation(oCamera1), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, TIME_MOVE1, oPC, CAMERA_MODE_TOP_DOWN, 145.0, 5.5, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);

    CutSetCamera(CUTSCENE_NUMBER, TIME_DIALOG + TIME_LINE_INTERVAL - 4.0, oPC, CAMERA_MODE_TOP_DOWN, 105.0, 10.5, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutActionCastFakeSpellAtObject(CUTSCENE_NUMBER, TIME_MOVE1 + 1.0, SUMMON_SPELL, oJnah, oCenter,
        PROJECTILE_PATH_TYPE_DEFAULT);

    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_RUNES,
             GetLocation(oRune1), 0.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES + TIME_RUNE_INTERVAL * 1, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_RUNES,
             GetLocation(oRune2), 0.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES + TIME_RUNE_INTERVAL * 2, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_RUNES,
             GetLocation(oRune3), 0.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES + TIME_RUNE_INTERVAL * 3, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_RUNES,
             GetLocation(oRune4), 0.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES + TIME_RUNE_INTERVAL * 4, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_RUNES,
             GetLocation(oRune5), 0.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES + TIME_RUNE_INTERVAL * 5, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_RUNES,
             GetLocation(oRune6), 0.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES + TIME_RUNE_INTERVAL * 7, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_RUNES,
             GetLocation(oRune7), 0.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES + TIME_RUNE_INTERVAL * 8, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_RUNES,
             GetLocation(oRune8), 0.0);


    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_RUNES_END, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_BRING,
             GetLocation(oCenter), 0.0);

    CutJumpToLocation(CUTSCENE_NUMBER, TIME_RUNES_END, oFigure, GetLocation(oCenter));

    //Tell me that you have the orb in hand J'nah
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oFigure, 40287);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_DIALOG + TIME_LINE_INTERVAL * 1, oFigure,  ANIMATION_LOOPING_TALK_NORMAL, TIME_LINE_INTERVAL);

    //The betrayal of our ally has left me in an awkward position. My gnolls were...
    fDelay = fDelay + 7.0;
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oJnah, 40288);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oJnah,  ANIMATION_LOOPING_TALK_PLEADING, TIME_LINE_INTERVAL);

    //He was your ally! Your incompetence is beginning to make me doubt the usefulness of our friendship.
    fDelay = fDelay + 6.0;
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oFigure, 40289);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oFigure,  ANIMATION_LOOPING_TALK_FORCEFUL, TIME_LINE_INTERVAL);

    //Even now my gnolls are searching for the kobolds who...
    fDelay = fDelay + 10.5;
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oJnah, 40290);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oJnah,  ANIMATION_LOOPING_TALK_PLEADING, TIME_LINE_INTERVAL);

    //One more mistake J'nah, and your life will be shorter than a candle flame in a windstorm.
    fDelay = fDelay + 2.5;
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oFigure, 40291);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oFigure,  ANIMATION_LOOPING_TALK_FORCEFUL, TIME_LINE_INTERVAL);

    //Well! Look what we have here!
    fDelay = fDelay + 10.0;
    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oQuasit, "Q3C_WP_FACING");
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oQuasit, 40292);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oQuasit,  ANIMATION_LOOPING_LOOK_FAR, TIME_LINE_INTERVAL);

    //There is never a candle around when you need one.
    fDelay = fDelay + 4.0;
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oFigure, 40293);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oFigure,  ANIMATION_LOOPING_TALK_LAUGHING, TIME_LINE_INTERVAL);

    fDelay = fDelay + 4.0;
    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oJnah, "Q3C_WP_FACING");
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oJnah,  ANIMATION_LOOPING_TALK_NORMAL, TIME_LINE_INTERVAL);
    CutDestroyObject(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oFigure);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oPC, DURATION_TYPE_INSTANT, SUMMON_EFFECT_BRING,
             GetLocation(oCenter), 0.0);

    //Let us find out who dares to trespass in my lair.
    fDelay = fDelay + 2.0;
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_DIALOG + fDelay, oJnah, 40294);

    fDelay = fDelay + 6.0;
    //End Cutscene Here
    DelayCommand(TIME_DIALOG + fDelay, ReturnPlayers());


}

void ReturnPlayers()
{
    //Return ALL PCs to starting positions if they joined the cutscene

    location lMainPC = GetLocation(GetWaypointByTag("wp_cut31mainpcreturn"));
    location lPCX = GetLocation(GetWaypointByTag("wp_cut31pcxreturn"));

    //PC movement locations
    object oPlayers = GetFirstPC();
    int nCutsceneNumber = 31;
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == nCutsceneNumber)
        {

            //AssignCommand(oPlayers, ClearAllActions());
            CutFadeOutAndIn(nCutsceneNumber, 0.0, oPlayers, FALSE);

            if (GetLocalInt(oPlayers, "nCUT31MAINPC") == 1)
            {
                object oArea = GetArea(oPlayers);
                CutJumpToLocation(nCutsceneNumber, 2.5, oPlayers, lMainPC, FALSE);
                //Change background music
                //
                MusicBackgroundChangeDay(oArea, TRACK_CITYSLUMNIGHT);
                MusicBackgroundChangeNight(oArea, TRACK_CITYSLUMNIGHT);
                MusicBackgroundPlay(oArea);
            }
            else
            {
                CutJumpToLocation(nCutsceneNumber, 2.5, oPlayers, lPCX, FALSE);

            }
            DelayCommand(3.0, RemoveCutInvis(oPlayers));
            CutSetCutsceneMode(nCutsceneNumber, 3.0, oPlayers, FALSE);
            DelayCommand(5.0, SetLocalInt(oPlayers, "nCutsceneNumber", 0));
        }

        oPlayers = GetNextPC();
    }
    SetLocalInt(GetModule(), "X1_CUT31RUNNING", 0);
}
void RemoveCutInvis(object oCreature)
{
    object oJnah = GetObjectByTag("Q3_JNAH");
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetName(GetEffectCreator(eEff1)) == GetName(oJnah))
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
    UnFreezeAssociate(oCreature);
}

object FreezeAssociate(object oPlayers)
{
    effect eAssociate = EffectCutsceneParalyze();
    //Cutscene Paralize any associates.
    object oHench = GetHenchman(oPlayers);
    if (oHench != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oHench);
    }
    object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
    if (oCompanion != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oCompanion);
    }
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
    if (oFamiliar != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oFamiliar);
    }
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
    if (oSummon != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oSummon);
    }
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayers);
    if (oDominated != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oDominated);
    }

    //We need to return oDominated in case the domination ended during the cutscene
    return oDominated;
}
void UnFreezeAssociate(object oPlayers)
{

 //Cutscene Paralize any associates.
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
        if (oHench != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oHench);
        }
        object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
        if (oCompanion != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oCompanion);
        }
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
        if (oFamiliar != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oFamiliar);
        }
        object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
        if (oSummon != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oSummon);
        }
        object oDominated = GetLocalObject(oPlayers, "oDominated");
        if (oDominated != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oDominated);
        }
}
void RemoveAssociateEffects(object oCreature)
{
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetEffectType(eEff1) == EFFECT_TYPE_CUTSCENE_PARALYZE)
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
}
