// drain the deva

#include "nw_i0_plot"
#include "x2c2_inc_plot"

void CreateBlood(object oPC)
{
    CreateItemOnObject("q3c_blood", oPC);
    AssignCommand(oPC, SpeakStringByStrRef(84831));
}

void main()
{
    object oPC = GetPCSpeaker();
    object oBeam1 = GetNearestObjectByTag("q3c_beam1");
    object oBeam2 = GetNearestObjectByTag("q3c_beam2");
    object oDeva = GetNearestObjectByTag("q3c_Lavoera");
    if(oDeva == OBJECT_INVALID || GetIsDead(oDeva))
        return;
    effect eBeam = EffectBeam(VFX_BEAM_EVIL, oDeva, BODY_NODE_CHEST);
    effect eVis = EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL);
    int nUsed = GetLocalInt(oDeva, "MACHINE_USE");

    //DelayCommand(1.1, PlayVoiceChat(VOICE_CHAT_PAIN2, oDeva));
    AssignCommand(GetPCSpeaker(), DelayCommand(1.2, PlaySound("as_pl_screamf5")));

    nUsed++;
    SetLocalInt(oDeva, "MACHINE_USE", nUsed);

    DelayCommand(1.2, AssignCommand(oDeva, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), oDeva)));
    DelayCommand(1.0, AssignCommand(oDeva, SpeakOneLinerConversation()));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oDeva));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oDeva));
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oDeva));

    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oBeam2, 4.0));
    eBeam = EffectBeam(VFX_BEAM_EVIL, oBeam2, BODY_NODE_CHEST);
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oBeam1, 4.0));
    eBeam = EffectBeam(VFX_BEAM_EVIL, oBeam1, BODY_NODE_CHEST);
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, OBJECT_SELF, 4.0));
    if(nUsed == 3)
    {
        effect eDeath = EffectDeath();
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oDeva));
        DelayCommand(5.0, SetPlot("q3_deva", 96));
        Reward_2daXP(oPC, 25);
    }

    DelayCommand(5.0, CreateBlood(oPC));

    StoreCameraFacing();
    SetCameraMode(GetPCSpeaker(), CAMERA_MODE_TOP_DOWN);
    AssignCommand(GetPCSpeaker(), SetCameraFacing(255.0, 20.0, 50.0, CAMERA_TRANSITION_TYPE_FAST));
    DelayCommand(6.0, RestoreCameraFacing());
    //DelayCommand(6.5, AssignCommand(oPC, ActionResumeConversation()));
}
