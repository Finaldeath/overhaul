void main()
{
    //expose the map for the PC
    object oPC = GetPCSpeaker();
    object oArea = GetArea(OBJECT_SELF);
    ExploreAreaForPlayer(oArea, oPC);

    SetLocalInt(OBJECT_SELF, "nTalkedOnce", GetLocalInt(OBJECT_SELF, "nTalkedOnce") + 1);
    object oBattleMaster = GetObjectByTag("q2abattle2master");
    ExecuteScript("bat2_spawnatk2", oBattleMaster);
}
