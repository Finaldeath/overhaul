// Use a rope to go down the pit

void main()
{
    object oPC = GetPCSpeaker();
    location lLoc = GetLocation(GetObjectByTag("q3c_wp_rope"));
    AssignCommand(oPC, JumpToLocation(lLoc));
}
