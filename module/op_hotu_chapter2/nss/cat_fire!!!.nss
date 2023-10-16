//::///////////////////////////////////////////////
//:: Catapult: Fire!!!
//:: Cat_Fire!!!.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Fires the catapult at its current range &
    orientation.

    Go into cutscene mode to show the PC where the
    impact point is.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 30, 2002
//:://////////////////////////////////////////////
#include "inc_catapults!"
#include "x2_inc_cutscene"

int nCutsceneNumber = 104;

void StartCutscene(object oPC, location lCamera, float fDelay);

void main()
{
    object oCurrentArea = GetArea(OBJECT_SELF);
    object oPC = GetPCSpeaker();

    //Stop repeat firing of catapult
    SetLocalInt(OBJECT_SELF, "bParalyzed", TRUE);
    DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "bParalyzed", FALSE));



    vector vCurrentPosition = GetPosition(OBJECT_SELF);
    float fCurrentFacing = GetFacing(OBJECT_SELF);
    int iDefault = GetLocalInt(oPC, "bDefaultRange");

    //Calculate the target location.
    int iRange = GetLocalInt(oPC, "iRange");

//////////////////////////////////////////////////////////
    //This is a hack to work around a known GetFacing() //
    //math error in the scripting language. It can be   //
    //removed once the issue has been patched.          //
    if (fCurrentFacing > 360.0)                         //
    {                                                   //
        fCurrentFacing = 720 - fCurrentFacing;          //
    }                                                   //
//////////////////////////////////////////////////////////

    vector vDelta;
    vDelta.x = cos(fCurrentFacing) * iRange;
    vDelta.y = sin(fCurrentFacing) * iRange;

    vector vImpact;
    vImpact.x = vCurrentPosition.x + vDelta.x;
    vImpact.y = vCurrentPosition.y + vDelta.y;

    location lImpact = Location(oCurrentArea, vImpact, fCurrentFacing);
    float fImpactDelay = IntToFloat(iRange)/12;

    //Add some voice chat for ambience.
    int iRandom = Random(30);
    switch (iRandom)
    {
        case 0:
        {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1, oPC);
        }
        break;

        case 1:
        {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY2, oPC);
        }
        break;

        case 2:
        {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY3, oPC);
        }
        break;
    }

    //Play the catapult's VFX
    effect eImpact = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eBump = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
    //This cow projectile is an easter egg left behind by one of our programmers.
    //int iCowProjectile = 999;

    ActionCastSpellAtLocation(SPELL_FIREBALL, lImpact, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_BALLISTIC, TRUE);
    ActionWait(fImpactDelay);
    ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lImpact));
    ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBump, lImpact));

    //Parse for catapults and power-ups within the impact radius.
    //HandleImpactTargets(lImpact, 2.0, oPC, "Blast");
   //SendMessageToPC(oPC, "Firing");
    //If Battle 1 has started - do the betrayal cutscene
    if (GetLocalInt(GetModule(), "X2_BetrayOptionOpen") > 0)
    {
        DelayCommand(0.25, StartCutscene(oPC, lImpact, fImpactDelay));
        //SendMessageToPC(oPC, "Run cutscene");
    }
}

void StartCutscene(object oPC, location lImpact, float fDelay)
{
    //if the target site is within 5 meters of the inner gate - it will be destroyed by the catapult
    object oGate = GetObjectByTag("q2ainnergate");
    //SendMessageToPC(oPC, "Distance:" + FloatToString(GetDistanceBetweenLocations(lImpact, GetLocation(oGate))));
    if (GetDistanceBetweenLocations(lImpact, GetLocation(oGate)) < 5.0)
    {
        //Set variable so that summoning scene does not show
        SetLocalInt(GetModule(), "NoShowCutscene105", 1);
        SetPlotFlag(oGate, FALSE);
        DelayCommand(fDelay + 3.0, AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(500), oGate)));
        //SetLocalInt(oPC, "X2_Battle1_GateCatapultDeath", 1);
    }

}

