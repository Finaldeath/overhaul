void main()
{
if(GetIsObjectValid(GetObjectByTag("M3Q3B_FIRE_SPAWN_02")) == TRUE)
    {
    if(GetTag(OBJECT_SELF) == "M3Q3FIREELEM3")
        {
        SignalEvent(GetObjectByTag("M3Q3B_FIRE_SPAWN_02"),EventUserDefined(300));
        }
    else
        {
        SignalEvent(GetObjectByTag("M3Q3B_FIRE_SPAWN_02"),EventUserDefined(301));
        }
    }
}
