// * make middle pool speak if two gems are here
void main()
{
    if (GetLocalInt(GetNearestObjectByTag("M3Q2LampPRIM"), "NW_G_M2_GEMPRESSED") >0)
    {
        AssignCommand(GetNearestObjectByTag("M3Q2F18POOL"),ActionSpeakStringByStrRef(66244));
    }
}
