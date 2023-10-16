#include "help_general"

void main()
{
    object oKiller = GetLastKiller();

    object oCStone = GetNearestObjectByTag("PLAC_GHAA_CONT_STONE");

    int nRefSave;

    nRefSave = ReflexSave(oKiller, 13);

    if (nRefSave == 1)
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oCStone, BODY_NODE_CHEST, TRUE), oKiller, 2.5);

        if (GetIsPC(oKiller))
            SendMessageToPC(oKiller, "[Reflex Save Success.]  [An arc of lightning erupts from the Control Stone as you destroy the pedestal, but you quickly step aside to avoid it...]");
    }

    else
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(3, DAMAGE_TYPE_ELECTRICAL), oKiller);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oCStone, BODY_NODE_CHEST), oKiller, 2.5);

        if(Random(4) == 0)
        {    PlayVoiceChat(VOICE_CHAT_PAIN1, oKiller); }
        else if(Random(3) == 0)
        {    PlayVoiceChat(VOICE_CHAT_PAIN2, oKiller); }
        else if(Random(2) == 0)
        {    PlayVoiceChat(VOICE_CHAT_PAIN3, oKiller); }
        else
        {    PlayVoiceChat(VOICE_CHAT_CUSS, oKiller); }

        if (GetIsPC(oKiller))
        {
            SendMessageToPC(oKiller, "[Reflex Save Failure.]  [As you destroy the pedestal, an arc of magical lightning courses from the Control Stone through your body...]");
        }
    }

    int nCStoneDamage = GetLocalInt(oCStone, "N_HITS_TAKEN");

    nCStoneDamage++;

    SetLocalInt(oCStone, "N_HITS_TAKEN", nCStoneDamage);

    if (nCStoneDamage >= 12)
    {
        object oPC = GetFirstPC();

        if (GetLocalInt(oPC, "N_INSIDE_CSTONE_TRIG") == 1)
        {
            SetPlotFlag(oCStone, FALSE);

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oCStone);
        }

        else
            SetLocalInt(GetModule(), "N_CSTONE_DESTROY", 1);
    }
}
