void main()
{
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, 2);

    int iAlign1 = GetAlignmentLawChaos(oCreature);
    int iAlign2 = GetAlignmentGoodEvil(oCreature);
    string s1;
    string s2;

    if(iAlign1 == ALIGNMENT_NEUTRAL)
        s1 = "NEUTRAL";
    if(iAlign2 == ALIGNMENT_NEUTRAL)
        s2 = "NEUTRAL";
    if(iAlign1 == ALIGNMENT_LAWFUL)
        s1 = "LAWFUL";
    if(iAlign1 == ALIGNMENT_CHAOTIC)
        s1 = "CHAOTIC";
    if(iAlign2 == ALIGNMENT_GOOD)
        s2 = "GOOD";
    if(iAlign2 == ALIGNMENT_EVIL)
        s2 = "EVIL";

   // SpeakString(s1 + "/" + s2);
}
