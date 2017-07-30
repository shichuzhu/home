function ave_mat=get_10_ave(input_mat)

dimension=size(input_mat);
rank_mat=ndims(input_mat);
[length_mat,ind_modify]=max(dimension);

index_tran= repmat({':'},1,ndims(input_mat));
index_tran{ind_modify} =1:floor(length_mat/10)*10;

trans_mat=reshape(input_mat(index_tran{:}),10,floor(length_mat/10));
ave_mat=mean(trans_mat,1);
%%%%%%%%%%%%%%%%%%%%%%%% comment for taking effect
%ave_mat=input_mat;
end
