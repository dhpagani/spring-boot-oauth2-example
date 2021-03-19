import AbstractEntity from './abstract.entity';
import AbstractRepositoryRT from './abstract.repository';

export abstract class AbstractService<T extends AbstractEntity> {
    protected repository: AbstractRepositoryRT<T>;

    constructor(readonly repo: AbstractRepositoryRT<T>) {
        this.repository = repo;
    }
}
