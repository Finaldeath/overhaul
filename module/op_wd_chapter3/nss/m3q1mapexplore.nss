//* Makes Beorunna's Well start off explored
void main()
{
    ExploreAreaForPlayer(GetArea(OBJECT_SELF), GetEnteringObject());
    if(GetLocalInt(GetModule(),"NW_G_M3Q1A_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M3Q1A_AUTOSAVE",1);
    }
}
