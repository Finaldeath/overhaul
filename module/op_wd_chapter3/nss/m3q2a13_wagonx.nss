
// * wagon destroyed
void main()
{
    CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2_DEADWAGON", GetLocation(OBJECT_SELF));
    DestroyObject(OBJECT_SELF);
}
