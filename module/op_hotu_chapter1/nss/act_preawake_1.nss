//act_preawake_1
void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC));
}
