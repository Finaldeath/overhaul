// * MOves the player to the end of game area
void main()
{
    AssignCommand(GetLastUsedBy(),JumpToObject(GetObjectByTag("ENDPOINT"), FALSE));
}
