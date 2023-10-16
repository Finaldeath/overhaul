//player has 1 or more mirror shards

int StartingConditional()
{
   return GetItemPossessedBy(GetPCSpeaker(),"q6_shard")!= OBJECT_INVALID;
}
