// start Talon's disease on anyone who enters the area.

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oEnter = GetEnteringObject();
    if(!GetIsPC(oEnter))
        return;
    object oPriest = GetNearestObjectByTag("q6_priest");
    if(GetStringLeft(GetTag(oEnter), 3) != "q6e")
    {
        int nDoOnce = GetLocalInt(oEnter, "Q6E_DO_INIT_DISEASE_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(oEnter, "Q6E_DO_INIT_DISEASE_ONCE", 1);

        // remove other diseases the player might have
        effect eEff = GetFirstEffect(oEnter);
        while(GetIsEffectValid(eEff))
        {
            if(GetEffectType(eEff) == EFFECT_TYPE_DISEASE)
                 RemoveEffect(oEnter, eEff);
            eEff = GetNextEffect(oEnter);
        }
        if(!GetIsDead(oPriest))
            AssignCommand(oPriest, Talk(oEnter));
        SetLocalObject(GetArea(OBJECT_SELF), "DISEASE_TARGET", oEnter);
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));

    }
}
