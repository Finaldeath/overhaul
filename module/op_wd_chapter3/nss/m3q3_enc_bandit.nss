void main()
{
    object oWayA = GetObjectByTag("M3Q3_RAIDER_A");
    object oWayB = GetObjectByTag("M3Q3_RAIDER_B");
    
    if(OBJECT_SELF == oWayA)
    {
       SetEncounterActive(FALSE, oWayB);
    }
    else if(OBJECT_SELF == oWayB)
    {
       SetEncounterActive(TRUE, oWayA);
    }
}
