// give player fire immunity

void main()
{
    object oPC = GetExitingObject();
    SetLocalInt(oPC, "Q2D_INSIDE", 0);
    effect eEff = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEff))
    {
        if(GetEffectCreator(eEff) == OBJECT_SELF)
        {
            RemoveEffect(oPC, eEff);
            return;
        }
        eEff = GetNextEffect(oPC);
    }
}
