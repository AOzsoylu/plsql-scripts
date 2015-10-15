select file_id, block_id, blocks, segment_type, owner, segment_name, partition_name
from datafile_map
where file_id = &fileid
  and &blockid between block_id and block_id+blocks-1
/
