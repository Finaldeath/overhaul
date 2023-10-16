// Bring the "real" Halaster (create a copy of the clone)

void main()
{
    effect eVis = EffectVisualEffect(246);
    object oReal = GetNearestObjectByTag("q2d_halas2");
    object oSpeaker = OBJECT_SELF;
    AssignCommand(oReal, JumpToLocation(GetLocation(oSpeaker)));
    DelayCommand(0.1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oReal)));

}
