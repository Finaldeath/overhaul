void main()
{
    SetLocalInt(GetModule(),"M2Q2TerariBashDoor",1);
    location lSpawn = GetLocation(OBJECT_SELF);
    
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q2CTERARIBEAR",lSpawn);
    DestroyObject(OBJECT_SELF);
}
