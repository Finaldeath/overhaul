void main()
{
if(GetIsObjectValid(GetObjectByTag("M3Q3B_FIRE_SPAWN_01")) == TRUE)
    {
    if(GetTag(OBJECT_SELF) == "M3Q3FIREELEM1")
        {
        SignalEvent(GetObjectByTag("M3Q3B_FIRE_SPAWN_01"),EventUserDefined(300));
        }
    else
        {
        SignalEvent(GetObjectByTag("M3Q3B_FIRE_SPAWN_01"),EventUserDefined(301));
        }
    }
}
