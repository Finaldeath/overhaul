// Cutscene 72 ends:
// - Meph roars
// - Meph inits dialog with the pc.
// - Meph throws the player into hell.

#include "x2_inc_cutscene"

int CUTSCENE_NUMBER = 72;

void CallPlayAnimation2(int nCutscene, object oObject, int nAnimation, float fLength)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        AssignCommand(oObject, PlayAnimation(nAnimation, 0.7, fLength));
    }
}

void CutPlayAnimation2(float fDelay, object oObject, int nAnimation, float fLength, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallPlayAnimation(nCutscene, oObject, nAnimation, fLength)));
}

void main()
{
    effect eGhost = EffectCutsceneGhost();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, OBJECT_SELF);
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT);
    object oCopy = GetObjectByTag("q7b3_pc_copy");
    object oPC = GetLocalObject(GetArea(OBJECT_SELF), "Q7_MAIN_CUTSCENE_PC");
    object oMephJump = GetWaypointByTag("q7b_wp_camera1");

    CutApplyEffectToObject(1.0, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oCopy);
    CutPlaySound(1.0, oPC, "bf_huge");
    CutApplyEffectAtLocation(1.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_DUST_EXPLOSION, GetLocation(oMephJump));
    CutPlayAnimation2(4.0, OBJECT_SELF, ANIMATION_FIREFORGET_TAUNT, 0.0);
    CutPlaySound(4.0, oPC, "c_devil_bat2");
    CutBeginConversation(8.0, OBJECT_SELF, oPC, "q7_cut_meph1b");
}
