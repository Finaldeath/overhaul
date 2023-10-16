void main()
{
    //Get the object that is exiting the AOE
    object oTarget = GetExitingObject();
    int bValid = FALSE;
    //Search through the valid effects on the target.
    effect eAOE = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eAOE) && bValid == FALSE)
    {
        //If the effect was created by the Web then remove it
        if (GetEffectCreator(eAOE) == GetAreaOfEffectCreator())
        {
            if(GetEffectType(eAOE) == EFFECT_TYPE_MOVEMENT_SPEED_DECREASE)
            {
                    RemoveEffect(oTarget, eAOE);
                    bValid = TRUE;
            }
        }
        eAOE = GetNextEffect(oTarget);
    }
}
