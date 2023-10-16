void main()
{
    //Declare major variables including Area of Effect Object
    effect eAOE = EffectAreaOfEffect(AOE_PER_WEB,"M1Q4BWebA","M1Q4BWebC","M1Q4BWebB");
    location lTarget = GetLocation(GetNearestObjectByTag("M1Q4BWeb"));
    //Create an instance of the AOE Object using the Apply Effect function
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget,RoundsToSeconds(6));
}
